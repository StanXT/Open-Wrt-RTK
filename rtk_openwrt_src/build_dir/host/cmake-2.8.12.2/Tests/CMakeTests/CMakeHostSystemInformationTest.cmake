set(BadArg1-RESULT 1)
set(BadArg1-STDERR "missing RESULT specification")
set(BadArg2-RESULT 1)
set(BadArg2-STDERR "missing QUERY specification")
set(BadArg3-RESULT 1)
set(BadArg3-STDERR "does not recognize <key> FOOBAR")
set(QueryList-RESULT 0)
set(QueryList-STDERR "\\[[0-9]+;[0-9]+\\]")

function(try_and_print key)
	cmake_host_system_information(RESULT RESULT QUERY ${key})
	message(STATUS "[${key}] [${RESULT}]")
endfunction()

message("CTEST_FULL_OUTPUT (Avoid ctest truncation of output)")

try_and_print(NUMBER_OF_LOGICAL_CORES)
try_and_print(NUMBER_OF_PHYSICAL_CORES)
try_and_print(HOSTNAME)
try_and_print(FQDN)
try_and_print(TOTAL_VIRTUAL_MEMORY)
try_and_print(AVAILABLE_VIRTUAL_MEMORY)
try_and_print(TOTAL_PHYSICAL_MEMORY)
try_and_print(AVAILABLE_PHYSICAL_MEMORY)

include("/home/slobodan/openwrt-rtk/rtk_openwrt_src/build_dir/host/cmake-2.8.12.2/Tests/CMakeTests/CheckCMakeTest.cmake")

check_cmake_test(CMakeHostSystemInformation
	BadArg1
	BadArg2
	BadArg3
	QueryList
)
