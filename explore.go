	// Create and seed the generator.
	// Typically a non-fixed seed should be used, such as time.Now().UnixNano().
	// Using a fixed seed will produce the same output on every run.
	r := rand.New(rand.NewSource(99))
	
	import (
		"math/rand"
		"time"
	)

	func seedRandomNumberGenerator() *rand.Rand {
		// Seed the random number generator with the current time.
		seed := time.Now().UnixNano()
		r := rand.New(rand.NewSource(seed))
		return r
	}
