#define CAFFEINE_LIST_IMPLEMENTATION
#include <caffeine/containers/list.h>

int main(void)
{
    list_t list = list_init();

    index_a i;

    for (i = 0; i < 10; ++i)
    {
        int x = (i + 1);
        list.insert(&list, &x, sizeof(x), i);
    }

    printf("list.__lenght :: %lu\n", list.__lenght);

    lenght_a llenght = list.__lenght;

    for (i = 0; i < llenght; ++i)
    {
        index_a j = (llenght - i - 1);
        var x = NULL;
        list.retrieve(&list, j, &x); list.remove(&list, j);
        printf("@%lu :: %d\n", j, *(int*) x);
        free(x);
    }

    printf("list.__lenght :: %lu\n", list.__lenght);

    list.clear(&list);

    return 0;
}

// vim: sw=4 ts=4 sts=4 et tw=80 nospell :
