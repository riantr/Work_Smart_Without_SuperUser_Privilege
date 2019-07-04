if [ -z $1 ];then
echo -e "usage: arxivePDF xxxx.xxxxxx"
elif [ ! -f $1.pdf ];then
curl https://arxiv.org/pdf/$1.pdf > $1.pdf
evince $1.pdf
else
evince $1.pdf
fi
