// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    // Structure Post pour chaque message
    struct Post {
        string message;
        address author;
    }
    // Tableau dynamique pour stocker tous les messages publiés
    Post[] public posts;


    // Fonction pour publier un nouveau message
    function publishPost(string memory _message) public {
        // Crée un nouveau post et l'ajoute au tableau des posts
        posts.push(Post(_message, msg.sender));
    }
    // Fonction pour consulter un post par index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Index hors limite"); // Vérifie si l'index est valide
        Post storage post = posts[index];
        return (post.message, post.author);
    }
    // Fonction pour obtenir le nombre total de messages publiés
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}

