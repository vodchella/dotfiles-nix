# ╔═══════════════════════════════╦════════════════════════════════════════╗
# ║         ОКНА (WINDOWS)        ║           ПАНЕЛИ (PANES)               ║
# ╠═══════════════════════════════╬════════════════════════════════════════╣
# ║ Ctrl-a c       — Новое окно   ║ Ctrl-a |      — Вертикальный split     ║
# ║ Ctrl-a ,       — Переименовать║ Ctrl-a -      — Горизонтальный split   ║
# ║ Ctrl-a n / p   — След./пред.  ║ Ctrl-a o      — Следующая панель       ║
# ║ Alt-1 .. Alt-9 — Перейти к N  ║ Ctrl-a x      — Закрыть панель         ║
# ║ Ctrl-a w       — Список окон  ║ Ctrl-a Space  — Переключить раскладку  ║
# ╠═══════════════════════════════╬════════════════════════════════════════╣
# ║     КОПИРОВАНИЕ / ВСТАВКА     ║           ПЛАГИНЫ (TPM)                ║
# ╠═══════════════════════════════╬════════════════════════════════════════╣
# ║ Ctrl-a [       — Copy-mode    ║ Ctrl-a I       — Установить плагины    ║
# ║ Ctrl-a ]       — Вставить     ║ Ctrl-a U       — Обновить плагины      ║
# ║ y (в Copy-mode) — Копировать  ║ Ctrl-a Alt-r   — Восстановить сессию   ║
# ║ Ctrl-a PgUp    — Прокрутка    ║ Ctrl-a Ctrl-s  — Сохранить сессию      ║
# ╚═══════════════════════════════╩════════════════════════════════════════╝

{ config, pkgs, ... }:

let
  tpmSrc = pkgs.fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    sha256 = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
  };
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    terminal = "screen-256color";

    extraConfig = /* tmux */ ''
      ### Префикс: Ctrl-a
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      set  -g base-index 1
      setw -g pane-base-index 1

      # Общий стиль статусбара
      set -g status-position top
      set -g status-style bg=black,fg=white

      # Левая часть: hostname зелёным
      # set -g status-left "#[fg=green] #H "

      # Правая часть: дата и время
      set -g status-right "#[fg=yellow]%F #[fg=cyan]#(date +%%H:%%M) "

      # Обычные (неактивные) окна: белый текст, серый фон
      set -g window-status-format "#[fg=white,bg=black] #I:#W "
      # Активное окно: жёлтый фон, чёрный текст
      set -g window-status-current-format "#[fg=black,bg=yellow] #I:#W "
      # Разделитель между окнами
      set -g window-status-separator " "

      set -g status-justify left

      ### Быстрые клавиши переключения окон
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
      bind -n M-0 select-window -t 0

      ### Деление панелей
      bind | split-window -h
      bind - split-window -v

      ### Плагины
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'

      set -g @continuum-restore 'on'
      set -g @resurrect-capture-pane-contents 'on'

      run '~/.config/tmux/plugins/tpm/tpm'
    '';
  };

  xdg.configFile."tmux/plugins/tpm".source = tpmSrc;
}
