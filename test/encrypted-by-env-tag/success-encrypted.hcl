mock "tfplan/v2" {
    module {
        source = "./testdata/tfplan-encrypted.sentinel"
    }
}

mock "tfrun" {
    module {
        source = "./testdata/tfrun-prod.sentinel"
    }
}


test {
    rules  = {
        main = true
    }
}