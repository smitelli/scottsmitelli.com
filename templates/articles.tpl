{if $cfg->indexPage}
  <header>
    <h1>{$cfg->title}</h1>
  </header>
  {foreach from=$cfg->children key=permalink item=postData}
    {if $postData->inMenu}
      <article class="summary">
        <h2>
          <a href="{$cfg->baseUrl}/articles/{$permalink}">{$postData->title}</a>
        </h2>
        <p class="byline">
          <time datetime="{$postData->date}">{$postData->date|strtotime|date_format:"F j, Y"}</time>
        </p>
        <p>
          {$postData->summary} <a href="{$cfg->baseUrl}/articles/{$permalink}">More &raquo;</a>
        </p>
      </article>
    {/if}
  {/foreach}

{else if $cfg->summary}
  <article class="feature">
    <header>
      <h1>{$cfg->title}</h1>
      <p class="byline">
        {$cfg->author} |
        <time datetime="{$cfg->date}">{$cfg->date|strtotime|date_format:"F j, Y"}</time>
      </p>
    </header>

    {$subtemplate}
  </article>

  <p><a href="{$cfg->baseUrl}/articles">&laquo; Back to Article List</a></p>

  <link rel="stylesheet" href="{$cfg->staticUrl}/fancybox/jquery.fancybox.css">
  <link rel="stylesheet" href="{$cfg->staticUrl}/syntaxhighlighter/styles/shCoreDefault.css">
  <link rel="stylesheet" href="{$cfg->staticUrl}/syntaxhighlighter/styles/shThemeMidnight.css">
  <script src="{$cfg->staticUrl}/fancybox/jquery.fancybox.pack.js"></script>
  <script src="{$cfg->staticUrl}/syntaxhighlighter/scripts/shCore.js"></script>
  <script src="{$cfg->staticUrl}/syntaxhighlighter/scripts/shAutoloader.js"></script>
  <script>
    UTILS.fancyBoxWrap('.articles article');
    UTILS.doSyntaxHighlight();
  </script>

{else}
  {$subtemplate}
{/if}
