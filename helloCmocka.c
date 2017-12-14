//
// Created by Addo Dennis on 12/14/17.
//

#include <stdio.h>
#include <cmocka.h>
#include <stdlib.h>


static int setup(void **state) {
        int *answer = malloc(sizeof(int));

        assert_non_null(answer);
        *answer = 42;

        *state = answer;

        return 0;
}

static int teardown(void **state) {
        free(*state);

        return 0;
}

static void null_test_success(void **state) {
        (void) state;
}

/* A test case that does check if an int is equal. */
static void int_test_success(void **state) {
        int *answer = *state;

        assert_int_equal(*answer, 42);
}


int main(void) {
        const struct CMUnitTest tests[] = {
                cmocka_unit_test(null_test_success),
                cmocka_unit_test_setup_teardown(int_test_success, setup, teardown),
        };

        return cmocka_run_group_tests(tests, NULL, NULL);
}
