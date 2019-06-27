# src: http://ashkenazy.blogspot.tw/2013/06/shell-scripting.html

#建議開頭
#!/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
export LANG="en_US.UTF-8"

#註解
#user comment

#定義變數與列印變數
VAR="hello world"
echo $VAR

printf "\33[1;31m"
printf "Color Version: $VAR"
printf "\33[0m\n"

# 變數與變數、數字相加
let "sum=a+b"
let "sum=a+10"
sum=$((a+b))
sum=$((a+10))

#正常結束
exit 0

#if-else判斷式
if [ -n "$INPUT" ] && ["$INPUT" == "Yes" ]; then
  echo "result is Yes"
elif [ -n "$INPUT" ] && [ "$INPUT" == "No" ]; then
  echo "result is No"
else
  echo "wrong input"
fi

#讀取argument
if [ ! -z "$1" ]; then
  ARGS=$1
fi
echo $ARGS

#檢查執行者身份
whoami_ret="$(whoami)"
if [ "$whoami_ret" != "root" ]; then
  echo "This script must be run as root"
  exit
fi

#使用者輸入
read -p "Please input (Y/N), default is N:" ANSWER
if [ "$ANSWER" == "Y" -o "$ANSWER" == "y" ]; then
  echo "result is Yes"
fi

#執行指令的結果
pyOpenSSL_ret="$(rpm -q python-openssl | grep install | wc -l)"
if [ "$pyOpenSSL_ret" == "1" ]; then
  echo "python-openssl is not installed, please install python-openssl"
  exit
fi  

#類似traverse陣列
SERVER_LIST=(192.168.0.1 192.168.0.2 192.168.0.3)
for IP in ${SERVER_LIST[@]}
do
  echo "IP address: $IP"
done

Switch case
case $CAR in
  AUDI | audi)
    echo "audi"
  ;;
  VOLVO | volvo)
    echo "volvo"
  ;;
  BENZ | benz)
    echo "benz"
  ;;
  *) 
    echo "wrong role type"
    exit
  ;;
esac

# while Loop
until [ "$ANSWER" == "yes" ]
do
  read -p "Please input \"yes\":" ANSWER
done

# while loop
i=0
while [ "$i" != "10" ]
do
  i=$(($i+1))
  echo $i
done

# for loop
for CAR in AUDI VOLVO BENZ
do
 echo ${CAR}
done

# for loop
for i in $(seq 1 10)
do
  echo ${i}
done

# for loop
for (( i=1; i<=10; i=i+1 ))
do
  echo $i
done

# for 迭代
for i in $(ls)
do
  echo $i
done

#等候某個事件發生
FILE_EXISTED=0;
while [ $FILE_EXISTED -ne "1" ]; 
do
  if [ -z "/root/test_file" ];then
    FILE_EXISTED=1
  fi
  sleep 1;
done

#Function
function PRINT_FUNCTION(){
  echo "args is $1"
}

PRINT_FUNCTION "first_args"


# 檔案比較
-f file	          file 存在，並且為一檔案。
-d file	          file 存在，並且為一目錄。
-r file	          執行此 script 者對 file 具有讀取權限。
-w file	          執行此 script 者對 file 具有寫入權限。
-x file	          執行此 script 者對 file 具有執行權限。
-e file	          file 存在於系統上。
-s file	          file 存在，並且檔案大小不為 0。
-u file	          file 具有 SUID 的屬性。
-g file	          file 具有 SGID 的屬性。
-k file	          file 具有 Sticky bit 的屬性。
file1 -nt file2	  file1 較 file2 為新 ( 根據修改時間作比較 )。
file1 -ot file2	  file1 較 file2 為舊 ( 根據修改時間作比較 )。

# 數值比較
n1 -eq n2	        n1 等於 n2。
n1 -ne n2	        n1 不等於 n2。
n1 -gt n2	        n1 大於 n2。
n1 -ge n2	        n1 大於等於 n2。
n1 -lt n2	        n1 小於 n2。
n1 -le n2	        n1 小於等於 n2。

# 字串比較
str1 = str2	      str1 等於 str2。
str1 != str2	    str1 不等於 str2。
str1 > str2	      str1 大於 str2。
str1 < str2	      str1 小於 str2。
-z str	          str 為空字串。
-n str	          str 為非空字串。

# 將字串前面的0去掉
echo "00005 00010 00601 00550" | awk '$0*=1'
