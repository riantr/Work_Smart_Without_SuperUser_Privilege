HEXO_HOME=~/work/hexo
HEXO_TOOLS_HOME=`pwd`
#npm install hexo-cli
cd ~/work
rm -rf ~/work/hexo
hexo init hexo 
cd hexo
git clone https://github.com/theme-next/hexo-theme-next themes/next
npm install hexo-filter-flowchart --save
npm install hexo-filter-sequence --save
#npm install hexo-filter-optimize --save
npm install hexo-generator-searchdb --save
npm install hexo-toc --save
npm install hexo-tag-bootstrap --save
#npm install hexo-recommended-posts --save
#cnpm install hexo-deployer-git --save
npm install hexo-util --save
#cnpm install hexo-cover-utils --save
#cnpm install hexo-reading-time --save
#vim themes/next/layout/post.ejs
#```
#<%- readingTime(page.content) %>
#```
#npm install hexo-pdf --save
#```
#{% pdf http://....pdf %}
#```
npm install hexo-generator-slidehtml --save
npm install hexo-filter-inline-assets --save
npm install 
hexo new page categories
hexo new page tags
cp ~/work/hexo.bak.2/source/categories/index.md $HEXO_HOME/source/categories/index.md
cp ~/work/hexo.bak.2/source/tags/index.md $HEXO_HOME/source/tags/index.md
#theme: next
#search:
#    path: search.xml
#    field: post
#    format: html
#    limit: 10000
sed -i 's/landscape/next/g' _config.yml
sed -i '$a\nsearch:\n    path: search.xml\n    field: post\n    format: html\n    limit: 10000\n' _config.yml
#local_search:
#    enable:true
#menu:
#   categories: /categories
#   tags: /tags
#links:
#    Title: https://github.com/riantr
#motion:
#   enable: false
sed -i '/local_search/{n;s/false/true/;}' themes/next/_config.yml
sed -i 's/#tags:/tags:/' themes/next/_config.yml
sed -i 's/#categories:/categories:/' themes/next/_config.yml
sed -i 's/#Title:/Title:/' themes/next/_config.yml
sed -i '/motion:/{n;s/true/false/;}' themes/next/_config.yml
#mv $HEXO_HOME/themes/next/source/css $HEXO_HOME/source/
#mv $HEXO_HOME/themes/next/source/fonts $HEXO_HOME/source/
#mv $HEXO_HOME/themes/next/source/images $HEXO_HOME/source/
#mv $HEXO_HOME/themes/next/source/js $HEXO_HOME/source/
#mv $HEXO_HOME/themes/next/source/lib $HEXO_HOME/source/
rm -rf $HEXO_HOME/themes/next/source
rm -rf $HEXO_HOME/source
cp -r $HEXO_TOOLS_HOME/source $HEXO_HOME
ln -s $HEXO_HOME/source $HEXO_HOME/themes/next/source
cp $HEXO_TOOLS_HOME/hexo* $HEXO_HOME
hexo g
hexo s -i 172.16.18.16 -p 8080
#hexo clean && hexo g && hexo d
