MEMORY {
    BOOT2   : ORIGIN = 0x10000000, LENGTH = 0x100
    FLASH   : ORIGIN = 0x10000100, LENGTH = {{app_flash}}K - 0x100
{%- if sto_flash != "0" %}
    STORAGE : ORIGIN = ORIGIN(FLASH) + LENGTH(FLASH), LENGTH = {{sto_flash}}K
{%- endif %}

    /* Pick one of the two options for RAM layout     */

    /* OPTION A: Use all RAM banks as one big block   */
    /* Reasonable, unless you are doing something     */
    /* really particular with DMA or other concurrent */
    /* access that would benefit from striping        */
    RAM   : ORIGIN = 0x20000000, LENGTH = 264K

    /* OPTION B: Keep the unstriped sections separate */
    /* RAM: ORIGIN = 0x20000000, LENGTH = 256K        */
    /* SCRATCH_A: ORIGIN = 0x20040000, LENGTH = 4K    */
    /* SCRATCH_B: ORIGIN = 0x20041000, LENGTH = 4K    */
}
{%- if sto_flash != "0" %}
__flash_size = {{sys_flash | times: 1024}};
__storage_flash_offset = ORIGIN(STORAGE) - ORIGIN(BOOT2);
{%- endif %}
