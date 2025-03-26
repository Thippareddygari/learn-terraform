provider "local" {}

resource "local_file" "foo" {
   content = "Hello world"
   filename = "test.txt"
}

variable "x" {
  default = 10
}

variable "y" {
  default = [1,"xy",true,0.4] #combination of types
}

variable "z" {
  default = {
    name ="john"
    age= 20
  }
}

output "x" {
  value = var.x
}

output "x1" {
  value = "value of -${var.x}"
}

output "y1" {
  value = var.y[2]
}

output "z" {
  value = "Name of the person ${var.z.name} - ${var.z["age"]}"
}

#tf vars manual loaded and automatically loaded 

variable "input" {
  
}

output "input_name" {
  value = var.input
}

variable "cla" {
  
}

output "cls"{
    value = var.cla
}