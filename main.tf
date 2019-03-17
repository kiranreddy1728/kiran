#bucket creation
resource "aws_s3_bucket" "creatingbucket" {
  bucket = "test123-63947027152sdf1123-lifecyclepolicy123" #Bucket name
  acl    = "private"
}
