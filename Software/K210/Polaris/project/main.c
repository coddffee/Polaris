#include <stdio.h>
#include <unistd.h>
#include "fpioa.h"
#include "gpio.h"
#include "sleep.h"

int main() {
    fpioa_set_function(12, FUNC_GPIO1);
    fpioa_set_function(13, FUNC_GPIO2);
    fpioa_set_function(14, FUNC_GPIO3);

    gpio_init();
    gpio_set_drive_mode(1, GPIO_DM_OUTPUT);
    gpio_set_drive_mode(2, GPIO_DM_OUTPUT);
    gpio_set_drive_mode(3, GPIO_DM_OUTPUT);
    gpio_pin_value_t value = GPIO_PV_HIGH;
    gpio_set_pin(1, value);
    gpio_set_pin(2, value);
    gpio_set_pin(3, value);
    while (1) {
        msleep(100);
        gpio_set_pin(1, value = !value);
        gpio_set_pin(2, value = !value);
        gpio_set_pin(3, value = !value);
    }
    return 0;
}