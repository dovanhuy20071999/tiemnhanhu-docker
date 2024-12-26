# Common aliases
alias c='clear'
alias cd..='cd ..'
alias doc='cd ~/Documents'
alias docs='docker compose stop'
alias docu='docker compose up -d'
alias dow='cd ~/Downloads'
alias dp='docker ps'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ga='git add'
alias gac='git add . && git commit -a -m '
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gl='git pull'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias go='git checkout'
alias gp='git push'
alias grep='grep --color=auto'
alias gs='git status'
alias h='history'
alias j='jobs -l'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias myip='curl http://ipecho.net/plain; echo'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


# Access to docker containers in interactive mode
alias api='cd $PROJECT_DIR && docker compose exec -i api /bin/sh'
alias php1='cd $PROJECT_DIR && docker compose exec -i php /bin/bash'
alias wiremock='cd $PROJECT_DIR && docker compose exec -i wiremock /bin/sh'
alias db='cd $PROJECT_DIR && docker compose exec -i db bash'
alias bdd='cd $PROJECT_DIR && docker compose exec -i bdd bash'
alias npm='cd $PROJECT_DIR && docker compose run --rm -i npm'

alias apilog='cd $PROJECT_DIR && docker compose logs app -f'
alias phplog='cd $PROJECT_DIR && docker compose logs php -f'
alias dblog='cd $PROJECT_DIR && docker compose logs db -f'
alias bddlog='cd $PROJECT_DIR && docker compose logs bdd -f'
alias chromelog='cd $PROJECT_DIR && docker compose logs chrome -f'
alias wiremocklog='cd $PROJECT_DIR && docker compose logs wiremock -f'

alias apidebug='cd $PROJECT_DIR/tools && tab-yellow && tab-title "api=API debugger locally (development environment)" && docker compose up --build api-debugger'
alias web='cd $PROJECT_DIR && tab-title "web=WEB locally" && docker compose exec -i web bash'

# Access to Postgres
#alias db='cd $PROJECT_DIR && tab-title "db=DB locally" && docker compose exec -i db psql -U postgres'
# Unit test + integration test
alias apitest='cd $PROJECT_DIR && tab-purple && tab-title "apitest=Testing API locally" && docker compose exec -i api bash /commands/python-pytest.sh'
alias webtest='cd $PROJECT_DIR && tab-purple && tab-title "webtest=Testing WEB locally" && docker compose exec -i web npm i && docker compose exec -i web npm run test'
# Tail logs
alias apilog='cd $PROJECT_DIR && docker compose logs api -f'
alias weblog='cd $PROJECT_DIR && tab-title "weblog=Tailing WEB logs locally" && docker compose logs web -f'

# Tail SQL logs of Postgres
alias lalog='cd $PROJECT_DIR && tail -f services/web/storage/logs/laravel.log'
alias sqllog='cd $PROJECT_DIR && tail -f storage/logs/laravel.log | grep SQL'
alias sqlog='sqllog'

# Debug commands in CI docker image
alias cidebug='cd $PROJECT_DIR/tools && tab-yellow && tab-title "api=CI/CD debugger" && docker compose run --rm -i cicd-debugger sh'
# INTERNAL TOOLS
# Use the command `alias` to list out all available commands after accessing to containers
# Terraform production environment
alias tfglobal='cd $PROJECT_DIR/tools && tab-red && tab-title "tfglobal=[PRODUCTION] Terraform" && docker compose run --rm -i tfglobal bash'
# Terraform development environment
alias tfprod='cd $PROJECT_DIR/tools && tab-yellow && tab-title "tfprod=[PROD] Terraform" && docker compose run --rm -i tfprod bash'
alias awsprod='cd $PROJECT_DIR/tools && tab-yellow && tab-title "awsprod=[PROD] AWS + Database" && docker compose run --rm -i awsprod bash'
