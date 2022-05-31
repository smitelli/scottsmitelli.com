var UTILS = {};

/**
 * Wraps all <img> tags found within the target element in an overlay wrapper,
 * and enables fancyBox behavior on those images. Will not change an image
 * unless it had its size reduced to fit into the layout.
 * @param string target Selector to search for <img> tags
 */
UTILS.fancyBoxWrap = function(target) {
  $(target).find('img').each(function() {
    var $image = $(this);
    var testImg = new Image();

    // Don't mess around with the thumbnails; they have their own CSS
    if ($image.attr('class') == 'thumb') { return; }

    // Callback function, fired when the test image loads
    $(testImg).load(function() {
      // Bail out if the image was not shrunk to fit on the page
      if (this.width <= $image.width() && this.height <= $image.height()) return;

      // Wrapper markup
      var $el = $('<span class="fbox-wrap"><span class="overlay"></span></span>');

      // Add wrapper directly before the image, move the image inside wrapper
      $el.insertBefore($image);
      $el.prepend($image);

      // Move image's classes to the wrapper
      $el.addClass($image.attr('class'));
      $image.removeAttr('class');

      // Enable fancyBox features
      $el.wrapInner($('<a/>', {
        'class': 'fancybox',
        'href':  $image.attr('src'),
        'title': $image.attr('alt')
      }));

    });

    // Load this src from cache, place it into a test image
    testImg.src = $image.attr('src');
  });

  $(target).find('.fancybox').fancybox();
};

/**
 * Configures and initializes the SyntaxHighlighter behavior.
 */
UTILS.doSyntaxHighlight = function() {
  var path = function() {
    var args   = arguments;
    var result = [];

    for (var i = 0; i < args.length; i++) {
      result.push(args[i].replace('@', ENV.staticUrl + '/syntaxhighlighter/scripts/'));
    }

    return result;
  };

  SyntaxHighlighter.autoloader.apply(null, path(
    'applescript            @shBrushAppleScript.js',
    'actionscript3 as3      @shBrushAS3.js',
    'bash shell             @shBrushBash.js',
    'coldfusion cf          @shBrushColdFusion.js',
    'cpp c                  @shBrushCpp.js',
    'c# c-sharp csharp      @shBrushCSharp.js',
    'css                    @shBrushCss.js',
    'delphi pascal pas      @shBrushDelphi.js',
    'diff patch             @shBrushDiff.js',
    'erl erlang             @shBrushErlang.js',
    'groovy                 @shBrushGroovy.js',
    'java                   @shBrushJava.js',
    'jfx javafx             @shBrushJavaFX.js',
    'js jscript javascript  @shBrushJScript.js',
    'perl pl                @shBrushPerl.js',
    'php                    @shBrushPhp.js',
    'text plain             @shBrushPlain.js',
    'py python              @shBrushPython.js',
    'ruby rails ror rb      @shBrushRuby.js',
    'sass scss              @shBrushSass.js',
    'scala                  @shBrushScala.js',
    'sql                    @shBrushSql.js',
    'vb vbnet               @shBrushVb.js',
    'xml xhtml xslt html    @shBrushXml.js'
  ));

  SyntaxHighlighter.defaults['class-name'] = 'syntax-highlight-box';
  SyntaxHighlighter.defaults['gutter']     = false;
  SyntaxHighlighter.defaults['toolbar']    = false;
  SyntaxHighlighter.all();
};
