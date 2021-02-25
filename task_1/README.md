1. Build docker image 

https://github.com/uphold/docker-litecoin-core/blob/master/0.18/Dockerfile

```
  mkdir -p $HOME/kraken/task_1
  cd $HOME/kraken/task_1
  curl -o a https://raw.githubusercontent.com/uphold/docker-litecoin-core/master/0.18/Dockerfile
  docker build -t localhost:5000/litecoin:0.18.1 -f Dockerfile .
```

2. Setup docker registry and push image
```
  mkdir $HOME/kraken/task_1/registry
  (there is a docker-compose.yml file)
  docker-compose up -d
  docker push localhost:5000/litecoin:0.18.1
``` 

3. Install anchor 
```
  mkdir $HOME/kraken
  cd $HOME/kraken
  virtualenv kraken
  source  kraken/bin/activate  
  pip3 install anchorecli
  cd $HOME/kraken/tasks_1
  mkdir anchore
  cd anchore/
  curl https://engine.anchore.io/docs/quickstart/docker-compose.yaml > docker-compose.yaml
  docker-compose up -d
```

4. Scan image
```
  export ANCHORE_CLI_PASS=foobar
  export ANCHORE_CLI_USER=admin
  anchore-cli image add 10.210.1.243:5000/litecoin:0.18.1
  anchore-cli image list
  anchore-cli image vuln 10.210.1.243:5000/litecoin:0.18.1 all
```

5. Results

Vulnerability ID        Package                                     Severity          Fix         CVE Refs                Vulnerability URL                                                   Type        Feed Group        Package Path        
CVE-2011-3389           libgnutls30-3.6.7-4+deb10u6                 Medium            None        CVE-2011-3389           https://security-tracker.debian.org/tracker/CVE-2011-3389           dpkg        debian:10         pkgdb               
CVE-2020-8284           curl-7.64.0-4+deb10u1                       Medium            None        CVE-2020-8284           https://security-tracker.debian.org/tracker/CVE-2020-8284           dpkg        debian:10         pkgdb               
CVE-2020-8284           libcurl4-7.64.0-4+deb10u1                   Medium            None        CVE-2020-8284           https://security-tracker.debian.org/tracker/CVE-2020-8284           dpkg        debian:10         pkgdb               
CVE-2020-8285           curl-7.64.0-4+deb10u1                       Medium            None        CVE-2020-8285           https://security-tracker.debian.org/tracker/CVE-2020-8285           dpkg        debian:10         pkgdb               
CVE-2020-8285           libcurl4-7.64.0-4+deb10u1                   Medium            None        CVE-2020-8285           https://security-tracker.debian.org/tracker/CVE-2020-8285           dpkg        debian:10         pkgdb               
CVE-2020-8286           curl-7.64.0-4+deb10u1                       Medium            None        CVE-2020-8286           https://security-tracker.debian.org/tracker/CVE-2020-8286           dpkg        debian:10         pkgdb               
CVE-2020-8286           libcurl4-7.64.0-4+deb10u1                   Medium            None        CVE-2020-8286           https://security-tracker.debian.org/tracker/CVE-2020-8286           dpkg        debian:10         pkgdb               
CVE-2004-0971           krb5-locales-1.17-3+deb10u1                 Negligible        None        CVE-2004-0971           https://security-tracker.debian.org/tracker/CVE-2004-0971           dpkg        debian:10         pkgdb               
CVE-2004-0971           libgssapi-krb5-2-1.17-3+deb10u1             Negligible        None        CVE-2004-0971           https://security-tracker.debian.org/tracker/CVE-2004-0971           dpkg        debian:10         pkgdb               
CVE-2004-0971           libk5crypto3-1.17-3+deb10u1                 Negligible        None        CVE-2004-0971           https://security-tracker.debian.org/tracker/CVE-2004-0971           dpkg        debian:10         pkgdb               
CVE-2004-0971           libkrb5-3-1.17-3+deb10u1                    Negligible        None        CVE-2004-0971           https://security-tracker.debian.org/tracker/CVE-2004-0971           dpkg        debian:10         pkgdb               
CVE-2004-0971           libkrb5support0-1.17-3+deb10u1              Negligible        None        CVE-2004-0971           https://security-tracker.debian.org/tracker/CVE-2004-0971           dpkg        debian:10         pkgdb               
CVE-2005-2541           tar-1.30+dfsg-6                             Negligible        None        CVE-2005-2541           https://security-tracker.debian.org/tracker/CVE-2005-2541           dpkg        debian:10         pkgdb               
CVE-2007-5686           login-1:4.5-1.1                             Negligible        None        CVE-2007-5686           https://security-tracker.debian.org/tracker/CVE-2007-5686           dpkg        debian:10         pkgdb               
CVE-2007-5686           passwd-1:4.5-1.1                            Negligible        None        CVE-2007-5686           https://security-tracker.debian.org/tracker/CVE-2007-5686           dpkg        debian:10         pkgdb               
CVE-2007-6755           libssl1.1-1.1.1d-0+deb10u5                  Negligible        None        CVE-2007-6755           https://security-tracker.debian.org/tracker/CVE-2007-6755           dpkg        debian:10         pkgdb               
CVE-2007-6755           openssl-1.1.1d-0+deb10u5                    Negligible        None        CVE-2007-6755           https://security-tracker.debian.org/tracker/CVE-2007-6755           dpkg        debian:10         pkgdb               
CVE-2010-0928           libssl1.1-1.1.1d-0+deb10u5                  Negligible        None        CVE-2010-0928           https://security-tracker.debian.org/tracker/CVE-2010-0928           dpkg        debian:10         pkgdb               
CVE-2010-0928           openssl-1.1.1d-0+deb10u5                    Negligible        None        CVE-2010-0928           https://security-tracker.debian.org/tracker/CVE-2010-0928           dpkg        debian:10         pkgdb               
CVE-2010-4051           libc-bin-2.28-10                            Negligible        None        CVE-2010-4051           https://security-tracker.debian.org/tracker/CVE-2010-4051           dpkg        debian:10         pkgdb               
CVE-2010-4051           libc6-2.28-10                               Negligible        None        CVE-2010-4051           https://security-tracker.debian.org/tracker/CVE-2010-4051           dpkg        debian:10         pkgdb               
CVE-2010-4052           libc-bin-2.28-10                            Negligible        None        CVE-2010-4052           https://security-tracker.debian.org/tracker/CVE-2010-4052           dpkg        debian:10         pkgdb               
CVE-2010-4052           libc6-2.28-10                               Negligible        None        CVE-2010-4052           https://security-tracker.debian.org/tracker/CVE-2010-4052           dpkg        debian:10         pkgdb               
CVE-2010-4756           libc-bin-2.28-10                            Negligible        None        CVE-2010-4756           https://security-tracker.debian.org/tracker/CVE-2010-4756           dpkg        debian:10         pkgdb               
CVE-2010-4756           libc6-2.28-10                               Negligible        None        CVE-2010-4756           https://security-tracker.debian.org/tracker/CVE-2010-4756           dpkg        debian:10         pkgdb               
CVE-2011-3374           apt-1.8.2.2                                 Negligible        None        CVE-2011-3374           https://security-tracker.debian.org/tracker/CVE-2011-3374           dpkg        debian:10         pkgdb               
CVE-2011-3374           libapt-pkg5.0-1.8.2.2                       Negligible        None        CVE-2011-3374           https://security-tracker.debian.org/tracker/CVE-2011-3374           dpkg        debian:10         pkgdb               
CVE-2011-4116           perl-base-5.28.1-6+deb10u1                  Negligible        None        CVE-2011-4116           https://security-tracker.debian.org/tracker/CVE-2011-4116           dpkg        debian:10         pkgdb               
CVE-2013-4235           login-1:4.5-1.1                             Negligible        None        CVE-2013-4235           https://security-tracker.debian.org/tracker/CVE-2013-4235           dpkg        debian:10         pkgdb               
CVE-2013-4235           passwd-1:4.5-1.1                            Negligible        None        CVE-2013-4235           https://security-tracker.debian.org/tracker/CVE-2013-4235           dpkg        debian:10         pkgdb               
CVE-2013-4392           libsystemd0-241-7~deb10u6                   Negligible        None        CVE-2013-4392           https://security-tracker.debian.org/tracker/CVE-2013-4392           dpkg        debian:10         pkgdb               
CVE-2013-4392           libudev1-241-7~deb10u6                      Negligible        None        CVE-2013-4392           https://security-tracker.debian.org/tracker/CVE-2013-4392           dpkg        debian:10         pkgdb               
CVE-2015-3276           libldap-2.4-2-2.4.47+dfsg-3+deb10u6         Negligible        None        CVE-2015-3276           https://security-tracker.debian.org/tracker/CVE-2015-3276           dpkg        debian:10         pkgdb               
CVE-2015-3276           libldap-common-2.4.47+dfsg-3+deb10u6        Negligible        None        CVE-2015-3276           https://security-tracker.debian.org/tracker/CVE-2015-3276           dpkg        debian:10         pkgdb               
CVE-2017-11164          libpcre3-2:8.39-12                          Negligible        None        CVE-2017-11164          https://security-tracker.debian.org/tracker/CVE-2017-11164          dpkg        debian:10         pkgdb               
CVE-2017-14159          libldap-2.4-2-2.4.47+dfsg-3+deb10u6         Negligible        None        CVE-2017-14159          https://security-tracker.debian.org/tracker/CVE-2017-14159          dpkg        debian:10         pkgdb               
CVE-2017-14159          libldap-common-2.4.47+dfsg-3+deb10u6        Negligible        None        CVE-2017-14159          https://security-tracker.debian.org/tracker/CVE-2017-14159          dpkg        debian:10         pkgdb               
CVE-2017-16231          libpcre3-2:8.39-12                          Negligible        None        CVE-2017-16231          https://security-tracker.debian.org/tracker/CVE-2017-16231          dpkg        debian:10         pkgdb               
CVE-2017-17740          libldap-2.4-2-2.4.47+dfsg-3+deb10u6         Negligible        None        CVE-2017-17740          https://security-tracker.debian.org/tracker/CVE-2017-17740          dpkg        debian:10         pkgdb               
CVE-2017-17740          libldap-common-2.4.47+dfsg-3+deb10u6        Negligible        None        CVE-2017-17740          https://security-tracker.debian.org/tracker/CVE-2017-17740          dpkg        debian:10         pkgdb               
CVE-2017-18018          coreutils-8.30-3                            Negligible        None        CVE-2017-18018          https://security-tracker.debian.org/tracker/CVE-2017-18018          dpkg        debian:10         pkgdb               
CVE-2017-7245           libpcre3-2:8.39-12                          Negligible        None        CVE-2017-7245           https://security-tracker.debian.org/tracker/CVE-2017-7245           dpkg        debian:10         pkgdb               
CVE-2017-7246           libpcre3-2:8.39-12                          Negligible        None        CVE-2017-7246           https://security-tracker.debian.org/tracker/CVE-2017-7246           dpkg        debian:10         pkgdb               
CVE-2018-1000654        libtasn1-6-4.13-3                           Negligible        None        CVE-2018-1000654        https://security-tracker.debian.org/tracker/CVE-2018-1000654        dpkg        debian:10         pkgdb               
CVE-2018-20796          libc-bin-2.28-10                            Negligible        None        CVE-2018-20796          https://security-tracker.debian.org/tracker/CVE-2018-20796          dpkg        debian:10         pkgdb               
CVE-2018-20796          libc6-2.28-10                               Negligible        None        CVE-2018-20796          https://security-tracker.debian.org/tracker/CVE-2018-20796          dpkg        debian:10         pkgdb               
CVE-2018-5709           krb5-locales-1.17-3+deb10u1                 Negligible        None        CVE-2018-5709           https://security-tracker.debian.org/tracker/CVE-2018-5709           dpkg        debian:10         pkgdb               
CVE-2018-5709           libgssapi-krb5-2-1.17-3+deb10u1             Negligible        None        CVE-2018-5709           https://security-tracker.debian.org/tracker/CVE-2018-5709           dpkg        debian:10         pkgdb               
CVE-2018-5709           libk5crypto3-1.17-3+deb10u1                 Negligible        None        CVE-2018-5709           https://security-tracker.debian.org/tracker/CVE-2018-5709           dpkg        debian:10         pkgdb               
CVE-2018-5709           libkrb5-3-1.17-3+deb10u1                    Negligible        None        CVE-2018-5709           https://security-tracker.debian.org/tracker/CVE-2018-5709           dpkg        debian:10         pkgdb               
CVE-2018-5709           libkrb5support0-1.17-3+deb10u1              Negligible        None        CVE-2018-5709           https://security-tracker.debian.org/tracker/CVE-2018-5709           dpkg        debian:10         pkgdb               
CVE-2018-6829           libgcrypt20-1.8.4-5                         Negligible        None        CVE-2018-6829           https://security-tracker.debian.org/tracker/CVE-2018-6829           dpkg        debian:10         pkgdb               
CVE-2019-1010022        libc-bin-2.28-10                            Negligible        None        CVE-2019-1010022        https://security-tracker.debian.org/tracker/CVE-2019-1010022        dpkg        debian:10         pkgdb               
CVE-2019-1010022        libc6-2.28-10                               Negligible        None        CVE-2019-1010022        https://security-tracker.debian.org/tracker/CVE-2019-1010022        dpkg        debian:10         pkgdb               
CVE-2019-1010023        libc-bin-2.28-10                            Negligible        None        CVE-2019-1010023        https://security-tracker.debian.org/tracker/CVE-2019-1010023        dpkg        debian:10         pkgdb               
CVE-2019-1010023        libc6-2.28-10                               Negligible        None        CVE-2019-1010023        https://security-tracker.debian.org/tracker/CVE-2019-1010023        dpkg        debian:10         pkgdb               
CVE-2019-1010024        libc-bin-2.28-10                            Negligible        None        CVE-2019-1010024        https://security-tracker.debian.org/tracker/CVE-2019-1010024        dpkg        debian:10         pkgdb               
CVE-2019-1010024        libc6-2.28-10                               Negligible        None        CVE-2019-1010024        https://security-tracker.debian.org/tracker/CVE-2019-1010024        dpkg        debian:10         pkgdb               
CVE-2019-1010025        libc-bin-2.28-10                            Negligible        None        CVE-2019-1010025        https://security-tracker.debian.org/tracker/CVE-2019-1010025        dpkg        debian:10         pkgdb               
CVE-2019-1010025        libc6-2.28-10                               Negligible        None        CVE-2019-1010025        https://security-tracker.debian.org/tracker/CVE-2019-1010025        dpkg        debian:10         pkgdb               
CVE-2019-18276          bash-5.0-4                                  Negligible        None        CVE-2019-18276          https://security-tracker.debian.org/tracker/CVE-2019-18276          dpkg        debian:10         pkgdb               
CVE-2019-19244          libsqlite3-0-3.27.2-3+deb10u1               Negligible        None        CVE-2019-19244          https://security-tracker.debian.org/tracker/CVE-2019-19244          dpkg        debian:10         pkgdb               
CVE-2019-19882          login-1:4.5-1.1                             Negligible        None        CVE-2019-19882          https://security-tracker.debian.org/tracker/CVE-2019-19882          dpkg        debian:10         pkgdb               
CVE-2019-19882          passwd-1:4.5-1.1                            Negligible        None        CVE-2019-19882          https://security-tracker.debian.org/tracker/CVE-2019-19882          dpkg        debian:10         pkgdb               
CVE-2019-20386          libsystemd0-241-7~deb10u6                   Negligible        None        CVE-2019-20386          https://security-tracker.debian.org/tracker/CVE-2019-20386          dpkg        debian:10         pkgdb               
CVE-2019-20386          libudev1-241-7~deb10u6                      Negligible        None        CVE-2019-20386          https://security-tracker.debian.org/tracker/CVE-2019-20386          dpkg        debian:10         pkgdb               
CVE-2019-20838          libpcre3-2:8.39-12                          Negligible        None        CVE-2019-20838          https://security-tracker.debian.org/tracker/CVE-2019-20838          dpkg        debian:10         pkgdb               
CVE-2019-9192           libc-bin-2.28-10                            Negligible        None        CVE-2019-9192           https://security-tracker.debian.org/tracker/CVE-2019-9192           dpkg        debian:10         pkgdb               
CVE-2019-9192           libc6-2.28-10                               Negligible        None        CVE-2019-9192           https://security-tracker.debian.org/tracker/CVE-2019-9192           dpkg        debian:10         pkgdb               
CVE-2019-9893           libseccomp2-2.3.3-4                         Negligible        None        CVE-2019-9893           https://security-tracker.debian.org/tracker/CVE-2019-9893           dpkg        debian:10         pkgdb               
CVE-2019-9923           tar-1.30+dfsg-6                             Negligible        None        CVE-2019-9923           https://security-tracker.debian.org/tracker/CVE-2019-9923           dpkg        debian:10         pkgdb               
CVE-2020-11656          libsqlite3-0-3.27.2-3+deb10u1               Negligible        None        CVE-2020-11656          https://security-tracker.debian.org/tracker/CVE-2020-11656          dpkg        debian:10         pkgdb               
CVE-2020-13776          libsystemd0-241-7~deb10u6                   Negligible        None        CVE-2020-13776          https://security-tracker.debian.org/tracker/CVE-2020-13776          dpkg        debian:10         pkgdb               
CVE-2020-13776          libudev1-241-7~deb10u6                      Negligible        None        CVE-2020-13776          https://security-tracker.debian.org/tracker/CVE-2020-13776          dpkg        debian:10         pkgdb               
CVE-2020-15719          libldap-2.4-2-2.4.47+dfsg-3+deb10u6         Negligible        None        CVE-2020-15719          https://security-tracker.debian.org/tracker/CVE-2020-15719          dpkg        debian:10         pkgdb               
CVE-2020-15719          libldap-common-2.4.47+dfsg-3+deb10u6        Negligible        None        CVE-2020-15719          https://security-tracker.debian.org/tracker/CVE-2020-15719          dpkg        debian:10         pkgdb               
CVE-2021-20193          tar-1.30+dfsg-6                             Negligible        None                                https://security-tracker.debian.org/tracker/CVE-2021-20193          dpkg        debian:10         pkgdb               
CVE-2021-27645          libc-bin-2.28-10                            Unknown           None                                https://security-tracker.debian.org/tracker/CVE-2021-27645          dpkg        debian:10         pkgdb               
CVE-2021-27645          libc6-2.28-10                               Unknown           None                                https://security-tracker.debian.org/tracker/CVE-2021-27645          dpkg        debian:10         pkgdb               
