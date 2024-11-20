add_metabench_profile(
    TARGET
    mb_test
    RANGE
    "[1, 100, 200]"
    TEMPLATES
    test_array.cpp.erb
    test_tuple.cpp.erb
    DS_ARGS
    MEDIAN_OF
    3
    CHART_ARGS
    TITLE
    "test")
