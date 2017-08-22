# java-maven-runner

This runner compiles the project and generate all jars (project + dependencies) when your playground is built.

At each play, it compiles user's answer using `javac` and run the specified main using `java`.

# How to Use

To use this runner for your project, edit the `techio.yml` file and add the following lines to your **project**:

```yaml
    runner: techio/java-maven-runner:1.0.0
```

## Example

**File tree:**

```
.
├── techio.yml            # Configuration file
├── statement.md          # The actual content of the playground
└── project/
    ├── pom.xml
	└── src/main/java/
		└── Main.java     # The stub provided to the user
```

**Main.java:**

```java
import org.apache.commons.lang3.StringUtils;

public class Main {
	public static void main(String[] args) {
	    System.out.println(StringUtils.isAlphanumeric("abc"));
	}
}
```

**pom.xml:**
```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.example</groupId>
	<artifactId>example</artifactId>
	<version>1.0.0</version>

	<dependencies>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
            <version>3.6</version>
        </dependency>
	</dependencies>
</project>
```

**statement.md:**
```md
@[]({
  "stubs": ["src/main/java/Main.java"],
  "command": "Main"
})
```

**techio.yml:**
```yaml
title: My playground
plan:
  - statement: statement.md
projects:
  java:
    root: /project
    runner: techio/java-maven-runner:1.0.0
```
