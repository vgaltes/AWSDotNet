# Serverless and terraform
This assumes that you have a valid AWS profile configured in your machine called serverless-local. If your profile is called in another way, update the publishDotNet.sh and publishNode.sh files.

To deploy a version of the lambda make a call like: `./publishDotNet.sh 1.0.1` Every time that you update the code, deploy a new version.