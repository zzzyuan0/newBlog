package configs

import (
	"github.com/olivere/elastic/v7"
)

var ES *elastic.Client
func ElasticSearchInit() error {
	client, err := elastic.NewClient(
		elastic.SetURL("http://121.37.224.175:9200"),
		elastic.SetBasicAuth("elastic", "Password"),
		elastic.SetSniff(false),
		)
	if err != nil {
		return err
	}
    ES = client
    return nil
}
