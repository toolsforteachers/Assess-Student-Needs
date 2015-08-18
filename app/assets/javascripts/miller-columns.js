/**
 * MIT License
 *
 * Copyright 2014 White Magic Software, Inc.
 */
"use strict";

/*jslint browser: true, devel: true, white: true, unparam: true */
/*global $, jQuery*/

(function( $, window, document, undefined ) {
  var settings;

  /** Returns a list of the currently selected items. */
  function chain() {
    return $(".column > .selected");
  }

  /** Add the breadcrumb path using the chain of selected items. */
  function breadcrumb() {
    var $breadcrumb = $("div.breadcrumb").empty();

    chain().each( function( item, crumb ) {
      $("<span/>").text( $(crumb).text().trim() ).appendTo( $breadcrumb );
    });
  }

  /** Ensure the viewport shows the entire newly expanded item. */
  function animation( $columns, $column ) {
    $columns.animate( { scrollLeft: $column.offset().left }, settings.delay );
  }

  /** Convert nested lists into columns using breadth-first traversal. */
  function unnest( $columns ) {
    var queue = [],
        $node;

    // Push the root unordered list item into the queue.
    queue.push( $columns.children() );

    while( queue.length ) {
      $node = queue.shift();

      $node.children().each( function( item, el ) {
        var $child = $(this).children(),
            $ancestor = $(this).parent().parent();

        // Retain item hierarchy (because it is lost after flattening).
        if( $ancestor.length && ($(this).data( "ancestor" ) === undefined) ) {
          // Use addBack to reset all selection chains.
          $(this).siblings().addBack().data( "ancestor", $ancestor );
        }

        if( $child.length > 0 ) {
          queue.push( $child );
          $(this).data( "child", $child ).addClass( "parent" );
        }

        // Causes item siblings to have a flattened DOM lineage.
        $(this).parent().appendTo( $columns ).addClass( "column" );
      });
    }
  }

  /** Hide columns (not the first). */
  function collapse() {
    $(".column:gt(0)").addClass( "collapse" );
  }

  /** Returns the last selected item (i.e., the current cursor). */
  function current() {
    return chain().last();
  }

  /** Hide columns (not the first), remove selections, update breadcrumb. */
  function reset() {
    collapse();
    chain().removeClass( "selected" );
    breadcrumb();

    // Upon reset ensure no value is returned to the calling code.
    settings.current( undefined );
  }

  /** Select item above current selection. */
  function moveU() {
    current().prev().click();
  }

  /** Select item below current selection. */
  function moveD() {
    current().next().click();
  }

  /** Select item left of the current selection. */
  function moveL() {
    var $ancestor = current().data( "ancestor" );

    if( $ancestor !== undefined ) {
      $ancestor.click();
    }
  }

  /** Select item right of the current selection, or down if no right item. */
  function moveR() {
    var $child = current().data( "child" );

    if( $child === undefined ) {
      moveD();
    }
    else {
      $child.children().first().click();
    }
  }

  function keypress( event ) {
    // Was an attempt made to move the currently selected item (the cursor)?
    var moved = false;

    switch( event.keyCode ) {
      case 27: // escape
        reset();
        break;
      case 38: // arrow up
        moveU();
        moved = true;
        break;
      case 40: // arrow down
        moveD();
        moved = true;
        break;
      case 37: // arrow left
        moveL();
        moved = true;
        break;
      case 39: // arrow right
        moveR();
        moved = true;
        break;
    }

    // If no item is selected, then jump to the first item.
    if( moved && (current().length === 0) ) {
      $(".column").first().children().first().click();
    }
  }

  $.fn.millerColumns = function( options ) {
    var defaults = {
      current: function( $item ) { return undefined; },
      breadcrumb: breadcrumb,
      animation: animation,
      delay: 500
    };

    settings = $.extend( defaults, options );

    return this.each( function() {
      var $columns = $(this);
      unnest( $columns );
      collapse();

      // Expand the requested child node on click.
      $columns.find( "li" ).on( "click", function( event ) {
        reset();

        var $child = $(this).data( "child" ),
            $ancestor = $(this);

        if( $child !== undefined ) {
          $child.removeClass( "collapse" ).children().removeClass( "selected" );
        }

        // Reveal (uncollapse) all ancestors to the clicked item.
        while( $ancestor !== undefined ) {
          $ancestor.addClass( "selected" ).parent().removeClass( "collapse" );
          $ancestor = $ancestor.data( "ancestor" );
        }

        settings.animation.call( this, $columns, $(this) );
        settings.breadcrumb.call( this );
        settings.current.call( this, $(this) );

        // Don't allow the underlying DIV to receive the click event.
        event.stopPropagation();
      });

      $columns.bind( 'keypress', keypress );

      $columns.on( "click", function() {
        reset();
      });

      // The last set of columns on the page recieves focus.
      $columns.focus();
    });
  };
}(jQuery));

