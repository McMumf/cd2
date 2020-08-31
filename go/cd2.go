package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

type Pairs struct {
	Pairs []Pair `json:"pairs"`
}

type Pair struct {
	Key   string `json:"key"`
	Value string `json:"value"`
}

func main() {

	fmt.Println("Hello there")

	jsonFile, err := os.Open("pairs.json")

	if err != nil {
		fmt.Println(err)
	}

	fmt.Println("Successfully Opened pairs.json")

	// defer the closing of our jsonFile so that we can parse it later on
	defer jsonFile.Close()

	// read our opened jsonFile as a byte array.
	byteValue, _ := ioutil.ReadAll(jsonFile)

	// we initialize our Users array
	var pairs Pairs

	// we unmarshal our byteArray which contains our
	// jsonFile's content into 'users' which we defined above
	json.Unmarshal(byteValue, &pairs)

	fmt.Println(pairs.Pairs[0].Key)

}
