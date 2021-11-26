package main

import (
	"fmt"
	"net"
)

func main() {
	fmt.Println("GoLang TCP 服务器")
	listen()
}

func listen() {
	listener, err := net.Listen("tcp", ":8080")

	if err != nil {
		fmt.Println("Failed to bind: ", err)

	}

	defer listener.Close()

	for {
		conn, err := listener.Accept()
		if err != nil {
			fmt.Println("Failed to bind: ", err)
		}

		go func() {
			buffer := make([]byte, 1024)
			bytesRead, error := conn.Read(buffer)
			message := string(buffer[0:bytesRead])

			if error != nil {
				fmt.Println("Error reading buffer ", error)
			} else {
				sResponse := "Hey!"
				bResponse := []byte(sResponse[0:len(sResponse)])
				fmt.Printf("[%d] %s", bytesRead, message)
				conn.Write(bResponse)
			}
		}()

		// go func(c net.Conn) {
		// fmt.Println(c)
		//	io.Copy(c, c) // Echo all incoming data
		//	c.Close()     // Close connection
		// }(conn)
	}

}
