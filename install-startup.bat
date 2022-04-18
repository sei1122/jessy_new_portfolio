rem gcloud compute instances create instance-1 --project=jessy-protfolio --zone=us-west1-b --machine-type=e2-micro --network-interface=address=34.82.240.59,network-tier=PREMIUM,subnet=default --public-ptr --public-ptr-domain=jessyjin.com. --maintenance-policy=MIGRATE --service-account=817745931695-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --enable-display-device --tags=http-server,https-server --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2004-focal-v20220406,mode=rw,size=10,type=projects/jessy-protfolio/zones/us-west1-b/diskTypes/pd-standard --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any --metadata=enable-oslogin=TRUE

rem timeout/t 60 /nobreak
call gcloud compute ssh seikoigi_gmail_com@instance-1 --command="rm -rf bin log"
call gcloud compute ssh seikoigi_gmail_com@instance-1 --command="mkdir bin"
call gcloud compute ssh seikoigi_gmail_com@instance-1 --command="mkdir log"
call gcloud compute scp cloudscript-startup.sh seikoigi_gmail_com@instance-1:./
call echo running cloudscript-startup.sh on remote computer
call gcloud compute ssh seikoigi_gmail_com@instance-1 --command="source ~/cloudscript-startup.sh 2>&1 | tee ~/log/startup.txt"
call gcloud compute scp seikoigi_gmail_com@instance-1:./log/startup.txt . && code startup.txt

rem rsync -aP web seikoigi_gmail_com@instance-1.us-west1-b.jessy-protfolio:web