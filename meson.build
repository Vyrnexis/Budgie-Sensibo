project('budgie-sensibo-monitor',
	version: '0.1.0',
	meson_version: '>= 0.48.0'
)

python = import('python')

message('Looking for dependencies')
python_bin = python.find_installation('python3', required: true)
message('Found python3 binary')

budgie3_dep = dependency('budgie-3.0', required: false)
budgie2_dep = dependency('budgie-2.0', required: false)
budgie1_dep = dependency('budgie-1.0', required: false)

budgie_gi_version = '3.0'
peas_loader = 'python'
if budgie3_dep.found()
	message('Found budgie-3.0; using Peas loader "python"')
elif budgie2_dep.found()
	message('Found budgie-2.0; using Peas loader "python"')
	budgie_gi_version = '2.0'
elif budgie1_dep.found()
	message('Found budgie-1.0; using Peas loader "python3"')
	budgie_gi_version = '1.0'
	peas_loader = 'python3'
else
	warning('No Budgie pkg-config dependency detected; defaulting to Budgie 3.0 + Peas loader "python".')
endif

# Global path variabel
prefix = get_option('prefix')
libdir = join_paths(prefix, get_option('libdir'))
datadir = join_paths(prefix, get_option('datadir'))
PIXMAPS_DIR = join_paths(datadir, 'pixmaps')
APPLET_INSTALL_DIR = join_paths(libdir, 'budgie-desktop',
	'plugins', meson.project_name())

conf = configuration_data()
conf.set('PROJECT_NAME', meson.project_name())
conf.set('BUDGIE_GI_VERSION', budgie_gi_version)
conf.set('PEAS_LOADER', peas_loader)

message('Installing applet...')

subdir('src')

configure_file(
	input: 'budgie-sensibo-monitor.py.in',
	output: 'budgie-sensibo-monitor.py',
	configuration: conf,
	install_dir: APPLET_INSTALL_DIR
)
