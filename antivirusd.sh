
#!/bin/bash
dir=$1
malicious_dir=$2
interval=$3

ls -l $dir > directory-info.last


is_malicious() {
    f=$1
    name=$(basename "$f")
    if grep -q -x "$name" whitelist.txt
    then 
       return 1
    fi
    ext="${f##*.}"
    for bad in exe bat vbs scr ps1
    do
        if [ "$ext" = "$bad" ]
        then
            return 0
        fi
    done
    if grep -i -q -E "virus|trojan|malware|worm|ransomware" "$f"
    then
        return 0
    fi
    return 1
}



while true
do
    sleep $interval
    ls -l $dir > directory-info.new
    if cmp -s directory-info.last directory-info.new
    then
        echo "no change"
    else
      echo "change detected"

for f in "$dir"/*
do
    if is_malicious "$f"
    then
        echo "$f is malicious and it is DELETED"
        cp "$f" "$malicious_dir"
        rm "$f"
    fi
done
        ls -l $dir > directory-info.last
    fi
done
