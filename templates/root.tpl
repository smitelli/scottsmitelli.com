<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=670">
    <title>
      {if $cfg->title}
        {$cfg->title} &bull; {$cfg->siteTitle}
      {else}
        {$cfg->siteTitle}: Web Guy, Sound Guy
      {/if}
    </title>
    <link rel="stylesheet" href="{$cfg->staticUrl}/style.css">
    <link rel="shortcut icon" href="{$cfg->baseUrl}/favicon.ico">
    <script src="{$cfg->staticUrl}/js/jquery.js"></script>
    <script src="{$cfg->staticUrl}/js/utilities.js"></script>
    <!--[if lt IE 9]><script src="{$cfg->staticUrl}/js/html5shiv.js"></script><![endif]-->
    <script>
      var ENV = {
        baseUrl:   '{$cfg->baseUrl}',
        staticUrl: '{$cfg->staticUrl}'
      };
    </script>
  </head>

  <body>
    <header id="branding">
      {if $cfg->bigBranding}
        <div class="wrap">
          <a id="logo" href="{$cfg->baseUrl}/">
            <img src="{$cfg->staticUrl}/images/header-scott.png" alt="{$cfg->siteTitle}">
          </a>
          <div class="web guy">Web Guy</div>
          <div class="sound guy">Sound Guy</div>
        </div>
      {else}
        <div class="wrap visibleOverflow">
          <a id="logo" href="{$cfg->baseUrl}/">
            <img src="{$cfg->staticUrl}/images/header-scottsmall.png" alt="{$cfg->siteTitle}">
          </a>
          {include file='templates/branding-nav.tpl'}
        </div>
      {/if}
    </header>

    <section class="wrap content {$pathclasses}">
      {$subtemplate}
    </section>

    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-7884449-1'], ['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
  </body>
</html>
