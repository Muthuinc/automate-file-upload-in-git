set -e
mkdir task
cd task
touch file{1..10}.txt
for mu in 1 2 3 4 5 6 7 8 9 10;
 do 
    echo "welcome" > file$mu.txt
done
cd ..
tar -cvzf new.tar.gz task/
echo "enter value a"
read a
echo "enter value b"
read b
if [ $a -eq $b ]
then
	echo "both values are same pushing file to master"
git clone https://github.com/Muthuinc/gittask1.git
git init
cp /home/incubus/Documents/new.tar.gz /home/incubus/Documents/gittask1
git add new.tar.gz
git commit -m "10 files compressed"
 git push origin master
else
	echo "both values are different pushing file to developers"
git clone https://github.com/Muthuinc/gittask1.git
git init
cp /home/incubus/Documents/new.tar.gz /home/incubus/Documents/gittask1
git add new.tar.gz
git commit -m "10 files compressed"
    git branch developer
    git checkout developer
    git push origin developer
fi
