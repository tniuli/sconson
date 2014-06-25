if [ $# != 1 ] ; then 
    echo "USAGE: $0 <project_name>" 
    exit 1; 
fi 

project_name=$1
sconson_home="/data0/vad/sconson/"
project_upper_case=$(echo $project_name | tr '[a-z]' '[A-Z]')

function replace_project_name(){
    sed -i s/example/${project_name}/g $1
    sed -i s/EXAMPLE/${project_upper_case}/g $1
}

if [ -d ${project_name} ]; then
  mv ${project_name} ${project_name}.`date +%y-%m-%H:%M:%S`
fi

mkdir ${project_name}
cd ${project_name}

#root
cp ${sconson_home}/data/SConstruct ./
cp ${sconson_home}/data/main_sconscript ./SConscript 
replace_project_name ./SConstruct

#source dir
mkdir ./${project_name}
cp ${sconson_home}/data/src_sconscript ./${project_name}/SConscript

#proto
mkdir ./${project_name}/proto

#test
mkdir ./${project_name}/test

cp ${sconson_home}/data/test.h.in ./${project_name}/test/
replace_project_name ./${project_name}/test/test.h.in

cp ${sconson_home}/data/test_main.cc ./${project_name}/test/
replace_project_name ./${project_name}/test/test_main.cc

#common
mkdir ./${project_name}/common
cp ${sconson_home}/data/common_sconscript ./${project_name}/common/SConscript
replace_project_name ./${project_name}/common/SConscript

cp ${sconson_home}/data/log.h ./${project_name}/common/
replace_project_name ./${project_name}/common/log.h

cp ${sconson_home}/data/define.h ./${project_name}/common/
replace_project_name ./${project_name}/common/define.h

#common test
mkdir ./${project_name}/common/unittest/
cp ${sconson_home}/data/common_test_sconscript ./${project_name}/common/unittest/SConscript
cp ${sconson_home}/data/common_unittest.cc ./${project_name}/common/unittest/
replace_project_name ./${project_name}/common/unittest/SConscript
replace_project_name ./${project_name}/common/unittest/common_unittest.cc

#bin
mkdir bin
cp ${sconson_home}/data/create_class.py bin
replace_project_name bin/create_class.py

#testdata
mkdir ./testdata
mkdir ./testdata/data/
mkdir ./testdata/conf/
cp ${sconson_home}/data/log4cpp.conf ./testdata/conf/
replace_project_name ./testdata/conf/log4cpp.conf

#tools
mkdir ./tools
#rpm
mkdir ./rpm
cp ${sconson_home}/data/build.sh ./rpm/
cp ${sconson_home}/data/package.sh ./rpm/package-release.sh
cp ${sconson_home}/data/package.sh ./rpm/package-debug.sh
cp ${sconson_home}/data/rpm_create ./rpm/
sed -i "s/example/example-release/g" ./rpm/package-release.sh
replace_project_name ./rpm/package-release.sh
sed -i "s/example/example-debug/g" ./rpm/package-debug.sh
replace_project_name ./rpm/package-debug.sh

cp ${sconson_home}/data/example.spec ./rpm/${project_name}-release.spec
replace_project_name ./rpm/${project_name}-release.spec
cp ${sconson_home}/data/example.spec ./rpm/${project_name}-debug.spec
replace_project_name ./rpm/${project_name}-debug.spec

#misc
mkdir ./misc
mkdir ./misc/data/
mkdir ./misc/conf/
touch ./misc/conf/${project_name}.conf
cp ${sconson_home}/data/log4cpp.conf ./misc/conf/
replace_project_name ./misc/conf/log4cpp.conf

#hudson
cp ${sconson_home}/data/hudson.sh ./
replace_project_name hudson.sh
cp ${sconson_home}/data/hudson.pre ./
replace_project_name hudson.pre
cp ${sconson_home}/data/hudson.post ./
replace_project_name hudson.post

cd ..

