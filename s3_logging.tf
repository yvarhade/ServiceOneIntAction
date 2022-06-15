resource "aws_s3_bucket" "examplebucket" {
  bucket = "examplebuckettftest"
}


resource "aws_s3_bucket" "examplebucket100" {
  bucket = "examplebuckettftest100"
    acl    = "private"
  versioning {
    enabled = true
    mfa_delete = true
  }
}
