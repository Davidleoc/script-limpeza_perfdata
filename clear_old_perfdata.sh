#!/bin/bash
#nome: clear_old_perfdata.sh

# Caminho onde ficam os diretórios de perfdata
PERFDATA_DIR="/usr/local/nagios/share/perfdata"

# Caminho do arquivo de log
LOG_DIR="/var/log/nagios/log_PERFDATA"

# Cria o diretório de log se não existir
mkdir -p "$(dirname "$LOG_DIR")"

# Cria o arquivo de log, se não existir
touch "$LOG_DIR" || {
  echo "Erro ao criar o arquivo de log: $LOG_DIR"
  exit 1
}

# Verifica se o diretório de perfdata existe
if [ ! -d "$PERFDATA_DIR" ]; then
  echo "Erro: Diretório $PERFDATA_DIR não encontrado!" | tee -a "$LOG_DIR"
  exit 1
fi

# Início do log
echo "==== $(date '+%Y-%m-%d %H:%M:%S') - Início da limpeza ====" >> "$LOG_DIR"
echo "Verificando diretórios com mais de 6 meses em $PERFDATA_DIR..." >> "$LOG_DIR"

# Procura diretórios com mais de 180 dias e os apaga, registrando no log
find "$PERFDATA_DIR" -mindepth 1 -maxdepth 1 -type d -mtime +180 -print -exec rm -rv {} \; >> "$LOG_DIR" 2>&1

# Fim do log
echo "==== $(date '+%Y-%m-%d %H:%M:%S') - Limpeza concluída ====" >> "$LOG_DIR"
echo "" >> "$LOG_DIR"
