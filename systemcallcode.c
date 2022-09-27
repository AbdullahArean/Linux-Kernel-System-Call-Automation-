
#include <linux/kernel.h>
#include <linux/syscalls.h>

SYSCALL_DEFINE0(sys_call1) {
printk("System Call executed using arean's automatic bash script\n");
return 0;

}