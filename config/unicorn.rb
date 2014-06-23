# Set the working application directory 
# working directory "/path/to/your/app"
working_directory "var/www/iman_portfolio"

# Unicorn PID file location
#pid "/path/to/pids/unicorn.pid"
pid "var/www/iman_portfolio/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "path/to/log/unicorn.log"
stderr_path "var/www/iman_portfolio/log/unicorn.log"
stdout_path "var/www/iman_portfolio/log/unicorn.log"

# Unicorn socket
# listen "tmp/unicorn.iman_portfolio.sock"
listen "tmp/unicorn.iman_portfolio.sock"

# Number of processes 
# worker_processes 4
worker_processes 2

# Time-out 
timeout 30