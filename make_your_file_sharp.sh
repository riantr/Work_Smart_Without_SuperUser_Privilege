echo -e "\tSuppose your special file extension is .$(whoami), this little script will help you to make it looks sharp."
declare -x  LS_COLORS="$LS_COLORS:*.$(whoami)=00;41"
echo -e "\tFor example, now I touch a file called [test.$(whoami)]."
touch test.$(whoami)
read -n 1
echo -e "\tAnd now I 'ls' it."
read -n 1
ls --color=auto
echo -e "\n\tYou got it?" 
read -n 1
echo -e "\tWanna make it permanent?"
read -t 30 -p  "Enter [Yes/No] to continue: " PERMENANT
if [[ "$PERMENANT" == "Yes"  ||  "$PERMENANT" == "yes" ]]; then
    echo 'export LS_COLORS="$LS_COLORS:*.$(whoami)=00;41"' >> ~/.profile
    echo -e "\tIt's done. You need 'source ~/.profile' or open a new shell to activate it."
else
    echo -e "\tDésolé!"
fi
