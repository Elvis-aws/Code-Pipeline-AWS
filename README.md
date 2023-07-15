
# Virtual ENV
- virtualenv env
- source env/bin/activate
- pip3 install -r requirements.txt
- pip3 freeze > requirements.txt

# Deploy template
- sam build
- sam deploy

# Code Pipeline
- Navigate to CodePipeline
- Source step fails because nothing exist in the Codecommit repository
- Cd to desktop
- Clone the code commit repository created 
- Paste into the empty repository all three files in the container folder
- Add, commit and push