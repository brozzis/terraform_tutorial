

clean:
	find . -name .terraform.lock.hcl -delete

indexer:
	sh indexer.sh

