
if [[ -e ~/.vimrc ]]; then 
  cp ~/.vimrc ./.vimrc
fi

if [[ -e ~/.vim ]]; then
  # 実行する処理、以下は例
  cp -r ~/.vim ./.vim
fi

if [[ -e ~/.config/nvim ]]; then
  cp -r ~/.config/nvim ./nvim
fi


