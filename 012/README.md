## count, for_each, for

> Note: A given resource or module block cannot use both count and for_each.

The `count` meta-argument accepts a whole number, and creates that many instances of the resource or module

The `for_each` meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set. 

A `for` expression creates a complex type value by transforming another complex type value.



### count 

```
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
```

### for_each

```
resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
  name     = each.key
}
```


### for 

```
[for s in var.list : upper(s) if s != ""]
```

