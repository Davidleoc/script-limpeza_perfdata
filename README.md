# script-limpeza_perfdata
Mantenha o Nagios limpo e ágil! Este script faz a limpeza automática do diretório  /usr/local/nagios/share/perfdata, eliminando dados antigos e melhorando a performance do seu monitoramento.
---

## 🚀 O que este script faz

- Vasculha a pasta `/usr/local/nagios/share/perfdata`
- Encontra diretórios com mais de 180 dias de idade ou seja aproximadamente 6 meses
- Remove esses diretórios com segurança
- Registra tudo em um log em `/var/log/nagios/log_PERFDATA`

---

## 🧠 Por que usar?

- 🗃️ Libera espaço em disco
- 🛡️ Remove lixo acumulado que o Nagios não usa mais
- 💡 Automatiza a manutenção sem intervenção humana
- 📉 Previne problemas de performance por excesso de arquivos

---

## 🛠️ Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/nagios-perfdata-cleaner.git
   cd nagios-perfdata-cleaner

## 💡 Sugestão

   Crie uma rotina usando cron dentro do seu servidor :
   
  ## Abra o cron:
  crontab -e

  ## Adicione a configuração:
   Este cron executa o script de limpeza do Nagios todos os dias à meia-noite.
   O script remove diretórios de perfdata com mais de 6 meses de idade.
   Toda a saída (stdout + stderr) é registrada em /var/log/nagios/perfdata_cron.log
   0 0 * * * /usr/local/scripts/clear_PERFDATA.sh >> /var/log/nagios/perfdata_cron.log 2>&1

Pronto, o escript esta automatizado!
   
