+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
description = 'The description goes here.'
#subheading = 'The subheading goes here.'
date = {{ time.Now.Format "2006-01-02" }}

#[[infoBox]]
#key = 'AI Disclosure :sparkles:'
#value = 'Ideally this is not needed.'
+++

{{% epigraph %}}
> The journey of a thousand miles begins with a single step.
> <footer>Lao Tzu</footer>
{{% /epigraph %}}

The content goes here.
