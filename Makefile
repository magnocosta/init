SOURCE_DIR=${DOTENV_PATH}
TARGET_DIR=${DOTENV_PATH}/test

install:
	ln -s ${SOURCE_DIR}/ack/ackrc ${TARGET_DIR}/.ackrc
	ln -s ${SOURCE_DIR}/git/gitconfig ${TARGET_DIR}/.gitconfig
	ln -s ${SOURCE_DIR}/nvim ${TARGET_DIR}/.config/nvim
	ln -s ${SOURCE_DIR}/tmux/tmux.conf ${TARGET_DIR}/.tmux.conf
	ln -s ${SOURCE_DIR}/tmuxinator.yml ${TARGET_DIR}/.tmuxinator.yml
	ln -s ${SOURCE_DIR}/zsh/zshrc.sh ${TARGET_DIR}/.zshrc
	ln -s ${SOURCE_DIR}/zsh/fzf.zsh ${TARGET_DIR}/.fzf.zsh
	ln -s ${SOURCE_DIR}/aerospace/aerospace.toml ${TARGET_DIR}/.aerospace.toml
	ln -s ${SOURCE_DIR}/jenkyborders/bordersrc ${TARGET_DIR}/.config/borders/bordersrc

uninstall:
	unlink ${TARGET_DIR}/.ackrc
	unlink ${TARGET_DIR}/.gitconfig
	unlink ${TARGET_DIR}/.config/nvim
	unlink ${TARGET_DIR}/.tmux.conf
	unlink ${TARGET_DIR}/.tmuxinator.yml
	unlink ${TARGET_DIR}/.zshrc
	unlink ${TARGET_DIR}/.fzf.zsh
	unlink ${TARGET_DIR}/.config/jenkyborders/bordersrc
