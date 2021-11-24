project('libiosea-hash',
	 'c',
	 version: '1.3.0',
	 license: 'LGPL3.0-or-later',
	 default_options : ['default_library=shared',
			     'werror=true'])

cc = meson.get_compiler('c')

options = cc.get_supported_arguments([
    '-Werror', 
    '-Wall'
])
add_project_arguments(options, language: 'c')

subdir('hash')

conf_data = configuration_data()
conf_data.set('LIBEXTSTORE_BASE_VERSION', meson.project_version())
conf_data.set('LIBEXTSTORE_EXTRA_VERSION', '')

distfile = meson.project_name() +  '-' + meson.project_version()
conf_data.set('CPACK_SOURCE_PACKAGE_FILE_NAME', distfile)

# Build the spec file
configure_file(input : 'libiosea-hash.spec-in.meson',
               output : 'libiosea-hash.spec',
               configuration : conf_data)

filespec = meson.source_root() + '/libiosea-hash.spec'
distdir = meson.build_root() + '/meson-dist/' + meson.project_name() +  '-' + meson.project_version()

meson.add_dist_script('/usr/bin/cp', filespec, distdir)
