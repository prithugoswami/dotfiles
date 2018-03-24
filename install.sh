##### THIS SCRIPT COPIES OVER ALL THE DOTFILES INTO THE HOME DIR #####


########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files=".zshrc .vimrc .vim"        # list of files/folders to symlink in homedir

##########


# Updateing the submodules in the git repo
git submodule init oh-my-zsh 

# copying the oh-my-zsh repo to the home dir
cp -r ./oh-my-zsh ~/.oh-my-zsh

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~
done

source ~/.zshrc
source ~/.vimrc
