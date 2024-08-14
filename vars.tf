# Configure these variables

variable "sample_var" {
  description = "A sample_var to pass to the template."
  type        = string
  default     = "hello"
}

variable "sleepy_time" {
  description = "How long our local-exec will take a nap."
  type        = number
  default     = 5400
}
