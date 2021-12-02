%define sourcename @CPACK_SOURCE_PACKAGE_FILE_NAME@
%global dev_version %{lua: extraver = string.gsub('@LIBIOSEA-HASH_EXTRA_VERSION@', '%-', '.'); print(extraver) }

Name: libiosea-hash 
Version: @LIBIOSEA-HASH_BASE_VERSION@
Release: 0%{dev_version}%{?dist}
Summary: Library to access to a namespace inside a KVS
License: LGPLv3 
Group: Development/Libraries
Url: http://github.com/phdeniel/libiosea-hash
Source: %{sourcename}.tar.gz
BuildRequires: gcc
Provides: %{name} = %{version}-%{release}

%description
The libiosea-hashi contains hashing functions. It is intended to be
used inside the IO-SEA namespace related tools and libs.

%package devel
Summary: Development file for the library libiosea-hash
Group: Development/Libraries
Requires: %{name} = %{version}-%{release} pkgconfig
Provides: %{name}-devel = %{version}-%{release}

%description devel
The libiosea-hashi contains hashing functions. It is intended to be
used inside the IO-SEA namespace related tools and libs.

%prep
%setup -q -n %{sourcename}

%build
cmake . 

make %{?_smp_mflags} || make %{?_smp_mflags} || make

%install

mkdir -p %{buildroot}%{_bindir}
mkdir -p %{buildroot}%{_libdir}
mkdir -p %{buildroot}%{_libdir}/pkgconfig
mkdir -p %{buildroot}%{_includedir}/iosea
mkdir -p %{buildroot}%{_sysconfdir}/iosea.d
install -m 644 include/iosea/hashlib.h  %{buildroot}%{_includedir}/iosea
install -m 644 libiosea-hash.pc  %{buildroot}%{_libdir}/pkgconfig
install -m 644 hash/libhashkvs.so %{buildroot}%{_libdir}

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_libdir}/libhashkvs.so*

%files devel
%defattr(-,root,root)
%{_includedir}/iosea/hashlib.h
%{_libdir}/pkgconfig/libiosea-hash.pc





%changelog
* Wed Nov  3 2021 Philippe DENIEL <philippe.deniel@cea.fr> 1.3.0
- Better layering between kvsns, kvsal aand extstore. 
