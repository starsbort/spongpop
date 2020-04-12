!/bin/bash
#----------------------------------------------
# This Source Was Developed By (ABS) @IQ_ABS. 
# This Is The Source Channel @Dev_Prox . 
#               - DevProx - 
#----------------------------------------------
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

install() {
wget "https://valtman.name/files/telegram-cli-1222"
mv telegram-cli-1222 tg
sudo chmod +x tg
echo -e "${GREEN}
#----------------------------------------------
# This Source Was Developed By (ABS) @IQ_ABS.
#   This Is The Source Channel @Dev_Prox .
#                - DevProx -
#----------------------------------------------${CNIL}"
echo -e "" 
echo -e "" 
}

if [ "$1" = "install" ]; then
install
else
if [ ! -f ./tg ]; then
echo "" 
echo ""
exit 1
fi
echo -e "\e[38;5;77m      • Welcome to source DevProx - اهلا بك في سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m           •{ Setting up offices - جاري رفع المكاتب } •\e[0m"
echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {0%}\e[0m"
sudo apt-get update
sudo apt-get upgrade -y

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {10%}\e[0m"

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev  -y
sudo apt-get install lua-lgi -y

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {20%}\e[0m"

sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get install libstdc++6 -y

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {30%}\e[0m"

sudo apt-get update -y
sudo apt-get upgrade -y

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {40%}\e[0m"

sudo luarocks install luasocket
sudo luarocks install luasecreset

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {50%}\e[0m"

sudo luarocks install redis-lua
sudo luarocks install lua-term
sudo luarocks install serpent

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {60%}\e[0m"

sudo luarocks install dkjson
sudo luarocks install Lua-cURL

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {70%}\e[0m"

sudo service redis-server start
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get install g++-4.7 -y c++-4.7

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {80%}\e[0m"

sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
sudo apt-get install screen -y
sudo apt-get install tmux -y

echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {90%}\e[0m"

sudo apt-get install libstdc++6 -y
sudo apt-get install lua-space -y
sudo apt-get install libnotify-dev -y
 
echo -e "\e[38;5;77m      • Installing source DevProx - جاري تحميل سورس ديف بروكس •\e[0m"
echo -e "\e[38;5;77m                                  {100%}\e[0m"
echo -e "\e[38;5;77m    • The download has finished successfully -  انتهى التحميل بنجاح  •\e[0m"

echo -e "\e[38;5;77m ----------------------------------------------------------------------- \e[0m"
echo -e "\e[38;5;77m 854534   1754278 9         1    1925279  1623029    6219924   9    6 \e[0m"
echo -e "\e[38;5;77m 1     9  1        4       5     1      9 1      9  6       5   8  4 \e[0m"
echo -e "\e[38;5;77m 1      3 1 9727    1     7      1     9  1     9  1         1   0 \e[0m"
echo -e "\e[38;5;77m 1      3 1 9727    1     7      121719   19636    1         1   0 \e[0m"
echo -e "\e[38;5;77m 1     9  1          3   1       1        1  97     3       6   3 7 \e[0m"
echo -e "\e[38;5;77m 16456    195387       0 _______ 1        1    46    9678421   9   6 \e[0m"
echo -e "\e[38;5;77m  ---------------------------------------------------------------------- \e[0m"
echo -e "\e[38;5;77m                        69        13264544   963135 \e[0m"
echo -e "\e[38;5;77m                       2  2       1       9 1      9       By: @IQ_ABS \e[0m"
echo -e "\e[38;5;77m                      1     1     1      9  1       9 \e[0m"
echo -e "\e[38;5;77m ___________________ 385347743    1821653   143203   ___________________\e[0m"
echo -e "\e[38;5;77m                    2         2   1      9         9 \e[0m"
echo -e "\e[38;5;77m                   3           3  1     9         9        CH: @Dev_Prox \e[0m"
echo -e "\e[38;5;77m                  7             7 1596248   112763 \e[0m"
echo -e "\e[38;5;77m ----------------------------------------------------------------------- \e[0m"

echo -e "\e[38;5;77m            ---------------------------------------------- \e[0m"
echo -e "\e[38;5;77m             This Source Was Developed By (ABS) @IQ_ABS.  \e[0m"
echo -e "\e[38;5;77m               This Is The Source Channel @Dev_Prox .  \e[0m"
echo -e "\e[38;5;77m                            - DevProx -  \e[0m"
echo -e "\e[38;5;77m            ---------------------------------------------- \e[0m"
./tg -s DevProx.lua
fi
