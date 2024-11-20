if(COMMAND add_metabench_profile)
    return()
endif()

add_custom_target(metabench_tests)

macro(get_metabench)
    if(NOT COMMAND metabench_add_chart)
        metabench_recipe(3322ce7)
    endif()
endmacro()

function(add_mb_profile)
    set(singleValueArgs TARGET RANGE)
    set(multiValueArgs TEMPLATES INCLUDE_DIRECTORIES LIBRARIES DS_ARGS
                       CHART_ARGS)
    cmake_parse_arguments(MB "" "${singleValueArgs}" "${multiValueArgs}"
                          ${ARGN})

    foreach(template ${MB_TEMPLATES})
        string(REPLACE "/" "_" dataset ${template})
        metabench_add_dataset(${dataset} "${template}" "${MB_RANGE}" NAME
                              ${dataset} ${MB_DS_ARGS})
        target_include_directories(${dataset} PRIVATE ${MB_INCLUDE_DIRECTORIES})
        target_link_libraries(${dataset} PRIVATE ${MB_LIBRARIES})
        list(APPEND datasets ${dataset})
    endforeach()

    metabench_add_chart(${MB_TARGET} DATASETS ${datasets} ${MB_CHART_ARGS})
    add_dependencies(metabench_tests ${MB_TARGET})
endfunction()

macro(add_metabench_profile)
    get_metabench()
    add_mb_profile(${ARGN})
endmacro()
