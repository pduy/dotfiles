if [ $(grep -c "colors: \*GruvboxLight" ~/.config/alacritty/alacritty.yml) -eq 1 ]; then
    sed -i -e "s/colors: \*GruvboxLight/colors: \*GruvboxDark/g" ~/.config/alacritty/alacritty.yml
    sed -i -e "s/set background=light/set background=dark/g" ~/.config/alacritty/alacritty.yml

elif [ $(grep -c "colors: \*GruvboxDark" ~/.config/alacritty/alacritty.yml) -eq 1 ]; then
    sed -i -e "s/set background=dark/set background=light/g" ~/.config/alacritty/alacritty.yml
fi

