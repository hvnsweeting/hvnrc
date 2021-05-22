//usr/bin/env go run $0 $@ ; exit $?
package main

// Scripte generates new blog post with a random Unsplash image

import "fmt"

import (
	"bufio"
	"encoding/json"
	"log"
	"net/http"
	"os"
	"strings"
	"text/template"
	"time"
)

type Post struct {
	Title       string
	Date        string
	Modified    string
	Tags        string
	Slug        string
	Description string
	ImageUrl    string
}

var TEMPLATE = `
title: {{ .Title }}
date: {{ .Date }}
modified: {{ .Date }}
tags: {{ .Tags }}
category: news
slug: {{ .Slug }}
authors: Pymier0
description: {{ .Description }}

![img]({{ .ImageUrl }})

# TODO CONTENT HERE

Đăng ký ngay tại [PyMI.vn](https://pymi.vn) để học Python tại Hà Nội TP HCM (Sài Gòn),
trở thành lập trình viên #python chuyên nghiệp ngay sau khóa học.
`

func main() {
	fmt.Println("vim-go")
	// f, err := os.Open("template.tpl")
	// if err != nil {
	// 	log.Fatal(err)
	// }
	// defer f.Close()
	// scanner := bufio.NewScanner(f)

	// var lines []string
	// for {
	// 	hasLine := scanner.Scan()
	// 	if !hasLine {
	// 		break
	// 	}
	// 	line := scanner.Text()

	// 	lines = append(lines, line)
	// }

	// ask stdin for questions
	fmt.Printf("Title: ")
	inputScanner := bufio.NewScanner(os.Stdin)
	inputScanner.Scan()
	title := inputScanner.Text()

	today := time.Now().Format("2006-01-02")

	fmt.Printf("Slug: ")
	inputScanner.Scan()
	slug := inputScanner.Text()

	fmt.Printf("Tags separated by , : ")
	inputScanner.Scan()
	tags := inputScanner.Text()

	fmt.Printf("Description in 140 chars: ")
	inputScanner.Scan()
	desc := inputScanner.Text()

	clientId := os.Getenv("CLIENT_ID")
	if len(clientId) == 0 {
		panic("Unsplash.com CLIENT_ID env is required.")
	}

	// generate new image
	url := fmt.Sprintf("https://api.unsplash.com/photos/random?client_id=%s&content_filter=high&topics=bo8jQKTaE0Y", clientId)
	resp, err := http.Get(url)
	if err != nil {
		log.Fatal(err)
	}

	jDecoder := json.NewDecoder(resp.Body)
	data := struct {
		Urls struct {
			Small string
		}
	}{}
	err = jDecoder.Decode(&data)
	if err != nil {
		log.Fatal(err)
	}
	newImageUrl := data.Urls.Small
	bigger := strings.Replace(newImageUrl, "w=400", "w=600", 1)
	fmt.Printf("IMG of today: %s\n", bigger)

	// write to file
	post := Post{
		Title:       title,
		Date:        today,
		Tags:        tags,
		Slug:        slug,
		Description: desc,
		ImageUrl:    bigger,
	}

	tpl, err := template.New("aname").Parse(TEMPLATE)
	if err != nil {
		log.Fatal(err)
	}

	newPost, err := os.Create("newpost.md")
	if err != nil {
		log.Fatal(err)
	}
	defer newPost.Close()

	err = tpl.Execute(newPost, post)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Wrote newpost.md. DONE!")
}
