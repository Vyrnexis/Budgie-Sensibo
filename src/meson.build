configure_file(
    input: 'budgie-sensibo-monitor.plugin',
    output: 'budgie-sensibo-monitor.plugin',
    configuration: conf,
    install_dir: APPLET_INSTALL_DIR
)

install_data(
    'com.solus-project.budgie-sensibo-monitor.gschema.xml',
    install_dir: join_paths(datadir, 'glib-2.0', 'schemas'),
)

install_data(
    'sensibo-monitor-icon.svg',
    'sensibo-monitor-icon-on.svg',
    install_dir: PIXMAPS_DIR
)

meson.add_install_script('meson_post_install')
