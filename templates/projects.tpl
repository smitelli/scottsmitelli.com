{if $cfg->indexPage}
  <header>
    <h1>{$cfg->title}</h1>
  </header>

  <p>
    Here are some things I've worked on over the years. Most are still running
    on the web somewhere.
  </p>

  {foreach from=$cfg->children key=permalink item=postData}
    {if $postData->inMenu}
      <article class="summary">
        {if $postData->thumb}
          <img src="{$cfg->uploadUrl}/{$postData->thumb}" alt="{$postData->title}" class="thumb">
        {/if}

        <h2>
          <a href="{$cfg->baseUrl}/projects/{$permalink}">{$postData->title}</a>
        </h2>
        <p>
          {$postData->summary} <a href="{$cfg->baseUrl}/projects/{$permalink}">More &raquo;</a>
        </p>
      </article>
    {/if}
  {/foreach}

{else if $cfg->summary}
  <article class="feature">
    {if $cfg->thumb}
      <img src="{$cfg->uploadUrl}/{$cfg->thumb}" alt="{$cfg->title}" class="thumb">
    {/if}

    <header>
      <h1>{$cfg->title}</h1>
    </header>

    {$subtemplate}
  </article>

  <p><a href="{$cfg->baseUrl}/projects">&laquo; Back to Projects</a></p>

  <link rel="stylesheet" href="{$cfg->staticUrl}/fancybox/jquery.fancybox.css">
  <link rel="stylesheet" href="{$cfg->staticUrl}/syntaxhighlighter/styles/shCoreDefault.css">
  <link rel="stylesheet" href="{$cfg->staticUrl}/syntaxhighlighter/styles/shThemeMidnight.css">
  <script src="{$cfg->staticUrl}/fancybox/jquery.fancybox.pack.js"></script>
  <script src="{$cfg->staticUrl}/syntaxhighlighter/scripts/shCore.js"></script>
  <script src="{$cfg->staticUrl}/syntaxhighlighter/scripts/shAutoloader.js"></script>
  <script>
    UTILS.fancyBoxWrap('.projects article');
    UTILS.doSyntaxHighlight();
  </script>

{else}
  {$subtemplate}
{/if}
