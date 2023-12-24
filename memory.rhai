print("Memory Config");

let sys_flash = parse_int(variable::prompt("System Flash Size in KiB", "2048", ["2048", "4096", "8192", "16384"]));
let sto_flash = parse_int(variable::prompt("Flash Reserved for Storage in KiB", "0", ["0", "256", "512", "1024", "2048"]));

let app_flash = sys_flash - sto_flash;

variable::set("sys_flash", sys_flash.to_string());
variable::set("app_flash", app_flash.to_string());
variable::set("sto_flash", sto_flash.to_string());